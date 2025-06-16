
-- This is a symbol available for people who need to know the locale (separate from GetLocale())
LOCALE_zhCN = true;
USE_IME = true;
STATFRAME_STATTEXT_FONT_OVERRIDE = TextStatusBarText;
CLOCK_TICKER_Y_OVERRIDE = 3;
GUILD_APPLICANT_LEVEL_TEXT_Y_OVERRIDE = 1
FIRST_NUMBER_CAP_VALUE = 10000;
COLLAPSE_ORDER_HALL_FOLLOWER_ITEM_LEVEL_DISPLAY = true;

function Localize()
	-- Put all locale specific string adjustments here
end

function GarrisonBuildingAlertFrame_AdjustTextPositions(frame)
	frame.Title:SetPoint("TOP", 18, -16);
	frame.Name:SetPoint("TOP", frame.Title, "BOTTOM", 0, -7);
end

function GarrisonFollowerAlertFrame_AdjustTextPositions(frame)
	frame.Title:SetPoint("TOP", 20, -15);
	frame.Name:SetPoint("TOP", frame.Title, "BOTTOM", 0, -8);
end

function GarrisonShipFollowerAlertFrame_AdjustTextPositions(frame)
	frame.Title:SetPoint("TOP", 45, -13);
	frame.Name:SetPoint("TOP", frame.Title, "BOTTOM", 0, -6);
	frame.Class:SetPoint("TOP", frame.Name, "BOTTOM", 0, -1);
end

function LocalizeFrames()
	-- Put all locale specific UI adjustments here

	-- Hide profanity checkbox
	-- UIOptionsFrameCheckButton5:Hide();

	for i = 1, WHOS_TO_DISPLAY do
		--Who tab
		_G["WhoFrameButton" .. i .. "Name"]:SetPoint("TOPLEFT", 10, -2);
	end

	--Fix the positioning of the dropdown list
	WhoFrameDropDown:SetPoint("TOPLEFT", WhoFrameColumnHeader2, "TOPLEFT", -15, 1);

	-- Guild Member Detail Window Custom Sizing
	GUILD_DETAIL_NORM_HEIGHT = 222
	GUILD_DETAIL_OFFICER_HEIGHT = 285

	-- Mailframe tabs
	for i=1, (MailFrame.numTabs or 0) do
		local tabName = "MailFrameTab"..i;
		_G[tabName.."Text"]:SetPoint("CENTER", tabName, "CENTER", 0, 5);
	end

	-- Chat Editbox
	ChatEdit_LanguageShow();

	local point, relativeTo, relativePoint, xOfs, yOfs;

	-- Player Frame
	point, relativeTo, relativePoint, xOfs, yOfs = PlayerFrameHealthBarText:GetPoint();
	PlayerFrameHealthBarText:SetPoint(point, relativeTo, relativePoint, 50, 3);

	-- Pet Frame
	PetFrameHealthBarText:SetPoint("CENTER", PetFrameHealthBarText:GetParent(), "TOPLEFT", 82, -26);
	PetFrameManaBarText:SetPoint("CENTER", PetFrameManaBarText:GetParent(), "TOPLEFT", 82, -34);

	-- Party Frame
	-- No party status text for Classic!
	--[[for i=1, MAX_PARTY_MEMBERS do
		local currPartyMemberBarText;

		-- adjust health bar text
		currPartyMemberBarText = _G["PartyMemberFrame"..i.."HealthBarText"];
		point, relativeTo, relativePoint, xOfs, yOfs = currPartyMemberBarText:GetPoint();
		currPartyMemberBarText:SetPoint(point, relativeTo, relativePoint, 20, 11);

		-- adjust mana bar text
		currPartyMemberBarText = _G["PartyMemberFrame"..i.."ManaBarText"];
		point, relativeTo, relativePoint, xOfs, yOfs = currPartyMemberBarText:GetPoint();
		currPartyMemberBarText:SetPoint(point, relativeTo, relativePoint, 20, 2);
	end]]

	-- Set range indicator for ActionBar. The text on action buttons is switched as needed so changing it here is enough.
	RANGE_INDICATOR = "•";

	-- Equipment Manager
	--[[GearManagerDialogPopup.BorderBox.NameText:SetPoint("TOPLEFT", 24, -18);
	GearManagerDialogPopup.BorderBox.ChooseIconText:SetPoint("TOPLEFT", 24, -66);]]

	-- Fix money display everywhere
	MONEY_TEXT_VADJUST = 2;

	-- Combat log config
	CombatConfigColorsExampleTitle:Hide();
	CombatConfigColorsExampleString1:SetPoint("TOPLEFT", 25, -16);
	CombatConfigFormattingExampleTitle:Hide();
	CombatConfigFormattingExampleString1:SetPoint("TOPLEFT", 15, -16);

	-- Friends
	for _, button in pairs(FriendsFrameFriendsScrollFrame.buttons) do
		button.info:SetPoint("TOPLEFT", button.name, "BOTTOMLEFT", 0, -6);
	end
	FRIENDS_BUTTON_NORMAL_HEIGHT = 38;
	FRIENDS_BUTTON_LARGE_HEIGHT = 52;
	-- add friend
	ADDFRIENDFRAME_WOWHEIGHT = 232;
	ADDFRIENDFRAME_BNETHEIGHT = 310;
	AddFriendNameEditBox:SetPoint("TOP", 0, -144);
	AddFriendNoteFrame:SetPoint("TOP", -2, -178);

	MIN_CHARACTER_SEARCH = 1;

	-- Interface Options
	InterfaceOptionsSocialPanelProfanityFilter:Disable();

	--TradeFrame
	TradeFramePlayerEnchantText:SetPoint("TOPLEFT", TradeFrame, 15, -357);

	-- GuildInviterFrame
	--[[GuildInviteFrameInviterName:SetPoint("TOP", GuildInviteFrame, 0, -22);
	GuildInviteFrameInviteText:SetPoint("TOP", GuildInviteFrameInviterName, 0, -16);
	GuildInviteFrameGuildName:SetPoint("TOP", GuildInviteFrameInviteText, 0, -10);]]

	-- Garrison Alerts
	--[[GarrisonBuildingAlertSystem:AddLocalizationHook(GarrisonBuildingAlertFrame_AdjustTextPositions);
	GarrisonFollowerAlertSystem:AddLocalizationHook(GarrisonFollowerAlertFrame_AdjustTextPositions);
	GarrisonShipFollowerAlertSystem:AddLocalizationHook(GarrisonShipFollowerAlertFrame_AdjustTextPositions);]]

	-- Honor stuff
	HonorFrameCurrentSessionTitle:SetPoint("TOPLEFT", "HonorFrame", "TOPLEFT", 36, -111);
	HonorFrameCurrentHK:SetPoint("TOPLEFT", "HonorFrameCurrentSessionTitle", "BOTTOMLEFT", 10, 1);
	HonorFrameYesterdayTitle:SetPoint("TOPLEFT", "HonorFrameCurrentSessionTitle", "BOTTOMLEFT", 0, -36);
	HonorFrameYesterdayHK:SetPoint("TOPLEFT", "HonorFrameYesterdayTitle", "BOTTOMLEFT", 10, -1);
	HonorFrameThisWeekTitle:SetPoint("TOPLEFT", "HonorFrameYesterdayTitle", "BOTTOMLEFT", 0, -43);
	HonorFrameThisWeekHK:SetPoint("TOPLEFT", "HonorFrameThisWeekTitle", "BOTTOMLEFT", 10, 2);
	HonorFrameLastWeekTitle:SetPoint("TOPLEFT", "HonorFrameYesterdayTitle", "BOTTOMLEFT", 0, -97);
	HonorFrameLastWeekHK:SetPoint("TOPLEFT", "HonorFrameLastWeekTitle", "BOTTOMLEFT", 10, 2);
	HonorFrameLifeTimeTitle:SetPoint("TOPLEFT", "HonorFrameLastWeekTitle", "BOTTOMLEFT", 0, -60);
	HonorFrameLifeTimeHK:SetPoint("TOPLEFT", "HonorFrameLifeTimeTitle", "BOTTOMLEFT", 10, 2);
end


