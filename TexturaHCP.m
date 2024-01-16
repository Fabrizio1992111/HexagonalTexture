%% Import Script for ODF Data
%
% This script was automatically created by the import wizard. You should
% run the whoole script or parts of it in order to import your data. There
% is no problem in making any changes to this script.

%% Specify Crystal and Specimen Symmetries

% crystal symmetry
CS = crystalSymmetry('6/mmm', [1 1 1.594], 'X||a*', 'Y||b', 'Z||c*', 'mineral', 'Zr', 'color', 'light blue');

% specimen symmetry
SS = specimenSymmetry('1');

% plotting convention
% setMTEXpref('yAxisDirection','inOfPlane');
% setMTEXpref('zAxisDirection','north');
setMTEXpref('xAxisDirection','north');
setMTEXpref('zAxisDirection','outOfPlane');

%% Specify File Names

% path to files
pname = 'C:\Users\Fabrizio\Documents\mtex-4.5.2';

% which files to be imported
fname = [pname '\zr_5678.tex'];

%% Import the Data

% specify kernel
psi = deLaValeePoussinKernel('halfwidth',10*degree);

% create an EBSD variable containing the data
odf = loadODF(fname,CS,SS,'density','kernel',psi,'resolution',10*degree,...
  'interface','generic',...
  'ColumnNames', { 'phi1' 'Phi' 'phi2' 'Weight'}, 'Bunge');

%PFs = [Miller(0,0,0,2,CS),Miller(1,0,-1,0,CS),Miller(1,0,-1,2,CS)];
PFs = [Miller(0,0,0,2,CS)]
figure
plotPDF(odf,PFs,'antipodal','colorrange','equal','minmax')%,'grid','on')

fprintf('Discretización: 10.000 orientaciones\n')
%nombre = 'Zrly-2_20ori.tex'; %antes 'ZnCuTi_XRD_ARp_10000ori'
%export_VPSC(odf,'Zrly-2_20ori.tex','points',20)
