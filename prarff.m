%PRARFF Convert ARFF file into PRTools dataset
%
%		A = PRARFF(FILE)
%
% INPUT
%   FILE    ARFF file
%
% OUTPUT
%   A       Dataset in PRTools format
%
% DESCRIPTION
% ARFF files as used in WEKA are converted into PRTools format. In case
% they don't fit (non-numeric features, varying feature length) an error is
% generated. Missing values are set to NaN.
%
% SEE ALSO (<a href="http://prtools.tudelft.nl/prtools">PRTools Guide</a>)
% DATASETS
function dataset = prarff(path)
    if nargin < 1
       error('Insert file path.'); 
    end

    file = open_file(path);

    metadata = parse_header(file);
    data = parse_data(file, metadata);
    fclose(file);

    feature_list = get_feature_names(metadata.feature_map);

    dataset = prdataset(data.data, data.labels);
    dataset = setfeatlab(dataset, feature_list);
    dataset = setname(dataset, metadata.dataset_name);
end

%Opens a file checking for errors
function file = open_file(path)
    if ~exist(path, 'file')    
        error('File not exist.');
    end

    [file, err] = fopen(path, 'r');

    if(err)
        error(err);
    end

end

%Convert feature names from feature map to line vector.
function features = get_feature_names(feature_map)
    features = cell(1, length(feature_map));
    for i=keys(feature_map)
        features{i{1}} = feature_map(i{1}).name;
    end
end

%PARSE_HEADER Parse arff header and returns the metadata.
% INPUT file
%   the arff file.
% OUTPUT struct metadata
%   dataset_name: the name of the dataset.
%   labels: a map containing the label values.
%       key: label name.
%       value: index of label on file.
%   feature_map: a map containing the declared features.
%       key: index of feature declaration.
%       value: a struct containing the feature data
%           name: feature name.
%           type: feature type.
function metadata = parse_header(file)
    feature_map = containers.Map('KeyType','int32', 'ValueType','any');
    feature_index = 1;

    metadata.dataset_name = parse_relation(file);

    has_read_data_declaration = false;
    has_read_labels = false;
    while ~feof(file)
        file_line = fgetl(file);
        if(isempty(file_line) || startsWith(file_line, '%'))
            continue;
        end
        
        if(strcmp(file_line, '@data'))
            has_read_data_declaration = true;
            break;
        end   

        [clause, value, data] = split_line(file_line);

        if(strcmpi(value, 'class'))
            if(has_read_labels)
               error('Duplicated class declaration.'); 
            end
            labels = parse_labels(clause, value, data);
            metadata.labels = labels;
            has_read_labels = true;
        else
            feature = parse_feature(clause, value, data);
            feature_map(feature_index) = feature;
            feature_index = feature_index + 1;
        end
    end
    if(~has_read_data_declaration)        
       warning('The file has no data declaration.'); 
    end
    metadata.feature_map = feature_map;
end

%Parse the @relation [name] declaration
% OUTPUT
%   the dataset name.
function relation = parse_relation(file)

 while ~feof(file)

    file_line = fgetl(file);
    if(isempty(file_line) || startsWith(file_line, '%'))
        continue;
    end

    spaces = strfind(file_line, ' ');

    clause = file_line(1:spaces-1);
    assert(strcmpi(clause, '@relation'), 'The relation must be the first declaration of the file.');

    name = file_line(spaces+1:length(file_line));
    relation = name;
    break;
 end
end


%Split @attribute declaration into its components.
%ex: '@attribute [name] [value]' -> {'@attribute', '[name]', '[value]'}
function [clause, value, data] = split_line(file_line)
    spaces = strfind(file_line, ' ');    
    clause = file_line(1:spaces(1)-1);
    value = file_line(spaces(1)+1:spaces(2)-1);
    data = file_line(spaces(2)+1:length(file_line));
end


%Parse the @attribute class [labels] declaration.
% OUTPUT labels map
%   key: label name.
%   value: label index.
function labels = parse_labels(clause, value, data)
    assert(strcmpi(clause, '@attribute'));
    assert(strcmpi(value, 'class'));
    data = strtrim(data);
    data = check_enclosing_braces(data);
    data = split(data, ',');
    labels = build_labels(data);
end

%Check if labels have correct braces and remove it.
function data = check_enclosing_braces(data)
    if(strcmp(data(1), '{'))
        data = data(2:length(data));
    else 
        warning('The classes declaration must start with open brace ({)');
    end
    if(strcmp(data(length(data)), '}'))
        data = data(1:length(data)-1);
    else 
        warning('The classes declaration must end with close brace (})');
    end
end

%Create a map with class labels.
% INPUT
%   list with label names.
% OUTPUT
%   key: label name.
%   value: label index.
function labels = build_labels(data)
    labels = containers.Map('KeyType', 'char', 'ValueType', 'int32');
    label_index = 1;
    for i = 1:size(data, 1)
        v = strtrim(data(i, :));
        labels(v{1}) = label_index;
        label_index = label_index + 1;    
    end

end

%Create a struct with attribute values.
function feature = parse_feature(clause, name, type)
    assert(strcmpi(clause, '@attribute'));
    feature.name = name;
    feature.type = type;
end

%Parse the @data section of the file.
% INPUT
%   the file after header parsing
% OUTPUT
%   a struct with the data values and labels.
%   data: the data values.
%   labels: the data labels.
function dataset = parse_data(file, metadata)
    data_index = 1;
    %todo do data preallocation to improve speed
    while ~feof(file)
        file_line = fgetl(file);
        data_line = strsplit(file_line, {',', '\t'});

        line_rage = data_line(1:length(data_line)-1);
        parsed_data = parse_data_line(line_rage, metadata);
        data(data_index, :) = parsed_data;

        labels{data_index} = data_line{length(data_line)};
        data_index = data_index +1;
    end

    dataset.data = data;
    dataset.labels = labels;
end

%Break a data line converting it's values.
% OUTPUT
%   return a line vector with the value converted by the metadata
%   description.
function parsed_data = parse_data_line(data_line, metadata)    
   
    parsed_data = zeros(1, length(data_line));

    assert(length(data_line) == length(metadata.feature_map), "The data line doesn't have all features.");
    for i=1:length(data_line)        
        
        if(~strcmp(data_line{i}, '?'))          
            
            value = convert_data(data_line{i}, metadata.feature_map(i).type);        
            parsed_data(i) = value;   
        else
            parsed_data(i) = NaN;
        end
    end    
end

%Convert the data string to the specified type.
function data = convert_data(value, type)

    switch(type)
        
        case {'numeric', 'integer', 'real'}
            data = str2double(value);
            
        %todo discretize string and date values to support non numeric
        %features.
        case {'string', 'date'}          
            error('Non numeric features is not supported yet.');            
        otherwise
            error('Unsuported type');        
    end


end
