classdef Prefs
%PREFS gives access to mbed preferences file
%
%   This is an undocumented class. Its methods and properties are likely to
%   change without warning from one release to the next.
%
%   Copyright 2009-2014 The MathWorks, Inc.
%             2014-2015 Dr. Olaf Hagendorf, HS Wismar

methods (Static, Access=public)
%%
function setPILSpeed(speed)
    mbed.Prefs.setPref('PILSpeed', speed);
end

%%
function speed = getPILSpeed
    speed = mbed.Prefs.getPref('PILSpeed');
    if isempty(speed)
        speed = 9600;    % take default speed
    end
end

%%
function setMbedTarget(target)
    mbed.Prefs.setPref('MbedTarget', target);
end

%%
function board = getMbedTarget
    board = mbed.Prefs.getPref('MbedTarget');
end

%%
function setMbedPath(toolPath) 

    if ~exist('toolPath', 'var') || ~ischar(toolPath) 
       nl = sprintf('\n');
       error('RTW:mbed:invalidMbedPath', ['Mbed path must be a string, e.g.' nl '   mbed.Prefs.setMbedPath(''c:\\GitHub\\mbed'')']);
    end

    if ~exist(toolPath,'dir')
        error('RTW:mbed:invalidMbedPath', 'The specified folder (%s) does not exist', toolPath);
    end

    if ~exist(fullfile(toolPath, 'mbed'), 'dir')
        error('RTW:mbed:invalidMbedPath', 'The specified folder (%s) does not contain library folder', toolPath);
    end

    % remove trailing backslashes
    toolPath = regexprep(toolPath, '\\+$', '');            

    % Alternate form of path to handle spaces
    % altPath = RTW.transformPaths(toolPath,'pathType','alternate');            

    mbed.Prefs.setPref('MbedPath', toolPath);
    %disp(mbed.Prefs.getPref('MbedPath'));
end
        
%%
function toolPath = getMbedPath
    toolPath = mbed.Prefs.getPref('MbedPath');
    % check validity of path (in case the folder got deleted between
    % after setMbedPath and before getMbedPath)
    if ~exist(toolPath,'dir') 
        nl = sprintf('\n');
        error('RTW:mbed:invalidMbedPath', ...
              ['Mbed path is unspecified or invalid: "' toolPath '"' nl ...
               'Specify a valid path using mbed.Prefs.setMbedPath, e.g.' nl ...
               '   mbed.Prefs.setMbedPath(''c:\\GitHub\\mbed'')']);
    end
end

%%
function setMbedProgrammer(programmer)
    mbed.Prefs.setPref('Programmer', programmer);
end

%%
function programmer = getMbedProgrammer
    programmer =  mbed.Prefs.getPref('Programmer');
end

%%
function setMbedDownload(val)
    mbed.Prefs.setPref('MbedDownload', val);
end

%%
function val = getMbedDownload
    val =  mbed.Prefs.getPref('MbedDownload');
end

%%
function setMbedRTOS(val)
    mbed.Prefs.setPref('MbedRTOS', val);
end

%%
function val = getMbedRTOS
    val =  mbed.Prefs.getPref('MbedRTOS');
end

%%
function setMbedDrive(devicePath) 
    % remove trailing backslashes
    devicePath = regexprep(devicePath, '\\+$', '');            

    mbed.Prefs.setPref('MbedDrive', devicePath);
end

%%
function devicePath = getMbedDrive
    devicePath = mbed.Prefs.getPref('MbedDrive');
end

%%
function setGccPath(toolPath) 

    if ~exist('toolPath', 'var') || ~ischar(toolPath) 
       nl = sprintf('\n');
       error('RTW:mbed:invalidGccPath', ...
              ['Gcc path must be a string, e.g.' nl ...
               '   mbed.Prefs.setGccPath(''C:\\GCC\\Sourcery_CodeBench_Lite_for_ARM_EABI\\bin'')']);
    end

    if ~exist(toolPath,'dir')
        error('RTW:mbed:invalidGccPath', 'The specified folder (%s) does not exist', toolPath);
    end

    if ~exist(fullfile(toolPath, 'arm-none-eabi-gcc.exe'), 'file')
        error('RTW:mbed:invalidGccPath', 'The specified folder (%s) does not contain arm-none-eabi-gcc.exe', toolPath);
    end

    % remove trailing backslashes
    toolPath = regexprep(toolPath, '\\+$', '');            

    % Alternate form of path to handle spaces
    altPath = RTW.transformPaths(toolPath,'pathType','alternate');            

    mbed.Prefs.setPref('GccPath', altPath);           
end
        
%%
function toolPath = getGccPath
    toolPath = mbed.Prefs.getPref('GccPath');
    % check validity of path (in case the folder got deleted between
    % after setGccPath and before getGccPath)
    if ~exist(toolPath,'dir') 
        nl = sprintf('\n');
        error('RTW:mbed:invalidGccPath', ...
              ['Gcc path is unspecified or invalid.' nl ...
               'Specify a valid path using mbed.Prefs.setGccPath, e.g.' nl ...
               '   mbed.Prefs.setGccPath(''C:\\GCC\\Sourcery_CodeBench_Lite_for_ARM_EABI\\bin'')']);
    end
end

%%
function setPythonPath(toolPath) 
    if ~exist('toolPath', 'var') || ~ischar(toolPath) 
       nl = sprintf('\n');
       error('RTW:mbed:invalidPythonPath', ...
              ['Python path must be a string, e.g.' nl ...
               '   mbed.Prefs.setPythonPath(''C:\\Python27'')']);
    end

    if ~exist(toolPath,'dir')
        error('RTW:mbed:invalidPythonPath', 'The specified folder (%s) does not exist', toolPath);
    end

    if ~exist(fullfile(toolPath, 'python.exe'), 'file')
        error('RTW:mbed:invalidPythonPath', 'The specified folder (%s) does not contain python.exe', toolPath);
    end

    % remove trailing backslashes
    toolPath = regexprep(toolPath, '\\+$', '');            

    % Alternate form of path to handle spaces
    altPath = RTW.transformPaths(toolPath,'pathType','alternate');            

    mbed.Prefs.setPref('PythonPath', altPath);           
end

%%
function toolPath = getPythonPath
    toolPath = mbed.Prefs.getPref('PythonPath');
    % check validity of path (in case the folder got deleted between
    % after setPythonPath and before getPythonPath)
    if ~exist(toolPath,'dir') 
        nl = sprintf('\n');
        error('RTW:mbed:invalidpythonPath', ...
              ['Python path is unspecified or invalid.' nl ...
               'Specify a valid path using mbed.Prefs.setPythonPath, e.g.' nl ...
               '   mbed.Prefs.setPythonPath(''C:\\Python27'')']);
    end
end
        
%%
function port = getComPort
    port = mbed.Prefs.getPref('ComPort');
%     if isempty(port)
%         nl = sprintf('\n');
%         msg = [
%             'The serial port must be set and you must have installed' nl ...
%             'the device drivers for your hardware. ' nl ...
%             ' 1. Install the drivers and connect the hardware. ' nl ...
%             ' 2. Identify the virtual serial (COM) port. You can do this through' nl ...
%             '    the Windows Device Manager, or by running mbed.Prefs.setComPort' nl ...
%             ' 3. Set the correct COM port using mbed.Prefs.setComPort' ...
%             ];
%         error('RTW:mbed:invalidComPort', msg);
%     end
end

%%
function setComPort(port)
    if ~exist('port', 'var') || ~ischar(port) || isempty(port)
        nl = sprintf('\n');
        error('RTW:mbed:invalidComPort', ...
              ['Specify the COM port as a string. E.g.: ' nl ...
               '   mbed.Prefs.setComPort(''COM8'') ']);
    end
    mbed.Prefs.setPref('ComPort', port);
end
%%
function port = getMbedAutoDetect
    port = mbed.Prefs.getPref('MbedAutoDetect');

end

%%
function setMbedAutoDetect(port)
    mbed.Prefs.setPref('MbedAutoDetect', port);
end
end

%%
methods(Static,Access=private)

%%
function setPref(prefName, prefValue)
    prefGroup = 'MbedGeneric';
    setpref(prefGroup, prefName, prefValue);
end

%%
function prefValue = getPref(prefName)
    prefGroup = 'MbedGeneric';
    if ispref(prefGroup,prefName)
        prefValue = getpref(prefGroup, prefName);
    else
        prefValue = '';
    end
end
end

end