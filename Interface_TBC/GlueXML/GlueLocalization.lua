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

	-- fix the credits screen
	-- CREDITS_ART_INFO[3] = {};
	-- CREDITS_ART_INFO[3][1] = { file="ColdarraNexTGA", w=1024, h=512, offsetx=0, offsety=0, maxAlpha=0.7 };

	-- zhCN Logo
	CLASSIC_MODERN_LOGO_OVERRIDE = {filename = 'Interface\\Glues\\Common\\GLUES-WOW-CLASSICLOGO', uv = { 0, 1, 0, 1 }};
	BURNING_CRUSADE_ORIGINAL_LOGO_OVERRIDE = {filename = 'Interface\\Glues\\Common\\GLUES-WOW-CHINESEBCLOGO', uv = { 0, 1, 0, 1 }};

	_G["CharacterCreateWoWLogo"]:SetPoint("TOPLEFT", _G["CharacterCreateFrame"], 3, 14) -- -3, +11
	_G["CharacterSelectLogo"]:SetPoint("TOPLEFT", 5, -5);
	_G["AccountLogin"].UI.GameLogo:SetPoint("TOPLEFT", 5, -5);

	tbcInfoIconAtlas = "classic-burningcrusade-infoicon-zhcn";
	tbcInfoPaneInfographicAtlas = "classic-announcementpopup-bcinfographic-zhcn";
	choicePaneCurrentLogoAtlas = "classic-burningcrusadetransition-choice-logo-current-zhcn";
	choicePaneOtherLogoAtlas = "classic-burningcrusadetransition-choice-logo-other-zhcn";

	SHOW_CHINA_AGE_APPROPRIATENESS_WARNING = true;
end

function GetCNLogoReleaseType()
	-- Due to licensing restrictions in China, we always want to use the original expansion's logo rather than the Classic logo. See CLASS-22057 for more info.
	return LE_RELEASE_TYPE_ORIGINAL;
end