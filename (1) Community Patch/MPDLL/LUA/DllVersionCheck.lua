return
Events.LoadScreenClose.Add(function()
	if not Game.CheckDllVersion(Modding.GetActivatedModVersion("d1b6328c-ff44-4b0d-aad7-c657f83610cd")) then
		local str = Locale.ConvertTextKey("TXT_KEY_MPDLL_ERROR_VERSION")
		Events.SerialEventGameMessagePopup( { Type = ButtonPopupTypes.BUTTONPOPUP_TEXT, Data1 = 800, Option1 = true, Text = str } ) 
	end
end)