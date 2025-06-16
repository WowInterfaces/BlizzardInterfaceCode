function Localize()
	-- Put all locale specific string adjustments here
end

function LocalizeFrames()
	CharacterCreateNameEdit:SetMaxLetters(12);

	-- Defined variable to show gameroom billing messages
	SHOW_GAMEROOM_BILLING_FRAME = 1;

	ONLY_SHOW_GAMEROOM_BILLING_FRAME_ON_PERSONAL_TIME = true;
	
	-- Hide save username button
	HIDE_SAVE_ACCOUNT_NAME_CHECKBUTTON = true;

	_G["CharacterSelectLogo"]:SetPoint("TOPLEFT", 5, -5);
	_G["AccountLogin"].UI.GameLogo:SetPoint("TOPLEFT", 5, -5);
	_G["CharacterCreateGender"]:Hide();

	SHOW_CHINA_AGE_APPROPRIATENESS_WARNING = true;
end

function SetCharacterGenderAppend(sex)
	if ( sex == Enum.UnitSex.Male ) then
		CharacterCreateGenderButtonMaleHighlightText:SetText(MALE);
		CharacterCreateGenderButtonMale:LockHighlight();
		CharacterCreateGenderButtonFemaleHighlightText:SetText("");
		CharacterCreateGenderButtonFemale:UnlockHighlight();
	else
		CharacterCreateGenderButtonMaleHighlightText:SetText("");
		CharacterCreateGenderButtonMale:UnlockHighlight();
		CharacterCreateGenderButtonFemaleHighlightText:SetText(FEMALE);
		CharacterCreateGenderButtonFemale:LockHighlight();
	end
end

function GetCNLogoReleaseType()
	-- Due to licensing restrictions in China, we always want to use the original expansion's logo rather than the Classic logo. See CLASS-22057 for more info.
	return LE_RELEASE_TYPE_ORIGINAL;
end