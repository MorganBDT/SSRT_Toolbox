function ShowBlank(obj, duration)
% SHOWBLANK shows a blank screen for the specified duration.
%   eg. ShowBlank(2.4) displays fixation cross for 2400 milliseconds. 

Screen('Flip',obj.window);

WaitSecs(duration);

end