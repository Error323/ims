
% imsDebug
%	If the global variable DEBUG == [true] all debug messages are displayed.
%	If DEBUG is the name of some category, only messages of that particular
%	category and messages with [true] as category name are displayed.
%
% input:
%	sCategory	The category of this debug message
%	sMessageh	The debug message
%
function imsDebug(sCategory, sMessage)

	global DEBUG;

	if ((length(DEBUG) == 1 && DEBUG == true) || (length(sCategory) == 1 && sCategory == true) || strcmp(DEBUG, sCategory))
		disp(sMessage);	
	end
	
end