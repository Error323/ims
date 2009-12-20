function imsDebug(sCategory, sMessage)

	global DEBUG;
	
	if ((length(DEBUG) == 1 && DEBUG == true) || strcmp(DEBUG, sCategory))

		disp(sMessage);
	
	end
	
end