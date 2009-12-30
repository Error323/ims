% imsDebug - Debug function
%	If the global variable DEBUG == [true] all debug messages are displayed.
%	If DEBUG is the name of some category, only messages of that particular
%	category and messages with [true] as category name are displayed.
%
% INPUTS:
%  - sCategory, the category of this debug message
%  - sMessage, the debug message
%
function imsDebug(sCategory, sMessage)

	global DEBUG;

	if (length(DEBUG) == 1 && DEBUG == true)
		bDisp = true;
	elseif (length(sCategory) == 1 && sCategory == true)
		bDisp = true;
	elseif (isa(DEBUG, 'cell') && sum(ismember(DEBUG, sCategory)) > 0)
		bDisp = true;
	elseif (isa(sCategory, 'cell') && sum(ismember(sCategory, DEBUG)) > 0)
		bDisp = true;
	elseif strcmp(DEBUG, sCategory)
		bDisp = true;
	else
		bDisp = false;
	end
	
	if bDisp
		try
			disp(['   - ' sMessage]);
		catch
			disp(['  >> Message could not be displayed!']); 
		end
	end
	
end