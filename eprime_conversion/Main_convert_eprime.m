% Converts all .txt files in eprime_conversion/eprime_input, which are from 
% experiment sessions run using E-Prime, to .mat session files. The .mat
% session files are deposited in eprime_conversion/session_files_output.
% The ePrimeTxt2vars.m function used to extract data from .txt files was
% provided by GitHub user yuval-harpaz (https://github.com/yuval-harpaz)

clear;

% Set the current MATLAB folder to the folder where this script is stored
disp('Setting the current MATLAB folder to the location of this script');
cd(fileparts(which(mfilename)));

input_directory = 'eprime_input';
output_directory = 'session_files_output';

dir_results = dir([input_directory '/*.txt']);
filenames = {dir_results.name};
disp(filenames)
assert(numel(filenames) > 0, ['No files found in ' input_directory]);

for i = 1:numel(filenames)
    [T, headervars] = eprimetxt2vars([input_directory '/' filenames{i}]);
    [trials, settings, subjectNumber, sessionNumber, sessionStartDateTime, triggerTimestamp] = convert_eprime(T, headervars); %#ok<*ASGLU>
    [~,filename,~] = fileparts(filenames{i});
    save([output_directory '/' filename], 'trials', 'settings', 'subjectNumber', 'sessionNumber', 'sessionStartDateTime', 'triggerTimestamp');
end

clear