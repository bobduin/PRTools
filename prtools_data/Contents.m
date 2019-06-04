%PRDATASETS: Pattern Recognition Datasets in PRTools format
% Version 2.1 13-Jul-2013
%
%The following datasets can be loaded by commands like A = DATASET_NAME.
%Most datasets have options to select classes or objects. Datasets with
%missing values are indicated by *. By default all objects or all features
%(depending on the dataset) having missing values are removed. 
%See MISVAL for other options.
%
%(m: #samples, k: #features  c:#classes)
%
% name        m      k   c  description
%-----------------------------------------------------------
%abalone    4177     8  28  age of abalone from physical measurements
%adult*    45222    14   2  income exceeding $50K/yr based on census data
%annealing*  898     9   5  steel annealing data
%arrhythmia  425   274  13  presence or absence of cardia arrhythmia
%arcene      200 10000   2  cancer recognition based on mass spectra
%audiology*  226    63  24  standardized audiology database 
%auto_mpg 	 398     6   2  car/miles-per-gallon
%balance_scale 625   4   5  balance scale weight & distance database
%balloons     76     4   2  psychology experiment conditions
%malaysia    291     8  20  segment features in utility symbols
%biomed*     194     5   2
%breast*     683     9   2  Wisconsion breast cancer dataset
%cbands    12000    30  24  chromosome banding patterns
%chromo     1143     8  24  chromosome blob features
%diabetes    768     8   2  Pima Indians Diabetes Database
%ecoli       272     7   3  protein localisation sites
%glass       214     9   4  glass types from chemical components
%heart       297    13   2  heart disease dataset
%imox        192     8   4  radial distances of characters
%ionosphere  351    34   2  
%iris        150     4   3  Fisher's Iris dataset
%liver       345     6   2  liver disorder
%mfeat-fac  2000   216  10  face features in digits dataset
%mfeat-fou  2000    76  10  Fourier features in digits dataset
%mfeat-kar  2000    64  10  Karhunen Loeve features in digits dataset
%mfeat-pix  2000   240  10  pixel features in digits dataset
%mfeat-zer  2000    53  10  Zernike moments in digits dataset
%mfeat-mor  2000     6  10  morphological features in digits dataset
%satellite  6435    36   6
%sonar       208    60   2  rock / metal sonar features
%soybean1    266    35  19  large Soybeans
%soybean2    136    35   4  small Soybeans
%spirals     194     2   2  spirals
%twonorm    7400    20   2  Leo Breiman's two normal example.
%ringnorm   7400    20   2  Leo Breiman's ringnorm example.
%wine        178    13   3  wine recognition
%x80          45     8   3  radial distances of characters
%
%   Multi-band images (pixels are objects, bands are features)
%
%emim     128*128   8   1  Some 8-band EM images
%lena     256*256   3   1  full-color image
%texturel 5*128*128 7   5  texture features for 5 different texture images
%texturet 256*256   7   5  composite texture image
%
%    Image datasets (pixels are features, images are objects)
%
%kimia     216   64*64 18  resampled (64*64) Kimia dataset of silhouettes
%nist32   5000   32*32 10  Resampled Nist digits
%nist16   2000   16*16 10  Normalized Nist digits

% Copyright: R.P.W. Duin, r.p.w.duin@37steps.com
% Faculty EWI, Delft University of Technology
% P.O. Box 5038, 2600 GA Delft, The Netherlands
