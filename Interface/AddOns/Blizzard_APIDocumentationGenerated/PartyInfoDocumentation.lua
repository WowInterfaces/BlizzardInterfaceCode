local PartyInfo =
{
	Name = "PartyInfo",
	Type = "System",
	Namespace = "C_PartyInfo",

	Functions =
	{
		{
			Name = "ConfirmLeaveParty",
			Type = "Function",
			Documentation = { "Immediately leave the party with no regard for potentially destructive actions" },

			Arguments =
			{
				{ Name = "category", Type = "luaIndex", Nilable = true },
			},
		},
		{
			Name = "DoCountdown",
			Type = "Function",

			Arguments =
			{
				{ Name = "seconds", Type = "number", Nilable = false },
			},

			Returns =
			{
				{ Name = "success", Type = "bool", Nilable = false },
			},
		},
		{
			Name = "GetActiveCategories",
			Type = "Function",
			MayReturnNothing = true,

			Returns =
			{
				{ Name = "categories", Type = "table", InnerType = "number", Nilable = false },
			},
		},
		{
			Name = "GetInviteConfirmationInvalidQueues",
			Type = "Function",
			MayReturnNothing = true,

			Arguments =
			{
				{ Name = "inviteGUID", Type = "WOWGUID", Nilable = false },
			},

			Returns =
			{
				{ Name = "invalidQueues", Type = "table", InnerType = "QueueSpecificInfo", Nilable = false },
			},
		},
		{
			Name = "GetMinLevel",
			Type = "Function",

			Arguments =
			{
				{ Name = "category", Type = "luaIndex", Nilable = true, Documentation = { "If not provided, the active party is used" } },
			},

			Returns =
			{
				{ Name = "minLevel", Type = "number", Nilable = false },
			},
		},
		{
			Name = "InviteUnit",
			Type = "Function",
			Documentation = { "Attempt to invite the named unit to a party, requires confirmation in some cases (e.g. the party will convert to a raid, or if there is a party sync in progress)." },

			Arguments =
			{
				{ Name = "targetName", Type = "cstring", Nilable = false },
			},
		},
		{
			Name = "IsCrossFactionParty",
			Type = "Function",

			Arguments =
			{
				{ Name = "category", Type = "luaIndex", Nilable = true, Documentation = { "If not provided, the active party is used" } },
			},

			Returns =
			{
				{ Name = "isCrossFactionParty", Type = "bool", Nilable = false },
			},
		},
		{
			Name = "IsPartyFull",
			Type = "Function",

			Arguments =
			{
				{ Name = "category", Type = "luaIndex", Nilable = true, Documentation = { "If not provided, the active party is used" } },
			},

			Returns =
			{
				{ Name = "isFull", Type = "bool", Nilable = false },
			},
		},
	},

	Events =
	{
		{
			Name = "BnetRequestInviteConfirmation",
			Type = "Event",
			LiteralName = "BNET_REQUEST_INVITE_CONFIRMATION",
			Payload =
			{
				{ Name = "gameAccountID", Type = "number", Nilable = false },
				{ Name = "questSessionActive", Type = "bool", Nilable = false },
				{ Name = "tank", Type = "bool", Nilable = false },
				{ Name = "healer", Type = "bool", Nilable = false },
				{ Name = "dps", Type = "bool", Nilable = false },
			},
		},
		{
			Name = "EnteredDifferentInstanceFromParty",
			Type = "Event",
			LiteralName = "ENTERED_DIFFERENT_INSTANCE_FROM_PARTY",
		},
		{
			Name = "GroupFormed",
			Type = "Event",
			LiteralName = "GROUP_FORMED",
			Payload =
			{
				{ Name = "category", Type = "number", Nilable = false },
				{ Name = "partyGUID", Type = "WOWGUID", Nilable = false },
			},
		},
		{
			Name = "GroupInviteConfirmation",
			Type = "Event",
			LiteralName = "GROUP_INVITE_CONFIRMATION",
		},
		{
			Name = "GroupJoined",
			Type = "Event",
			LiteralName = "GROUP_JOINED",
			Payload =
			{
				{ Name = "category", Type = "number", Nilable = false },
				{ Name = "partyGUID", Type = "WOWGUID", Nilable = false },
			},
		},
		{
			Name = "GroupLeft",
			Type = "Event",
			LiteralName = "GROUP_LEFT",
			Payload =
			{
				{ Name = "category", Type = "number", Nilable = false },
				{ Name = "partyGUID", Type = "WOWGUID", Nilable = false },
			},
		},
		{
			Name = "GroupRosterUpdate",
			Type = "Event",
			LiteralName = "GROUP_ROSTER_UPDATE",
		},
		{
			Name = "InstanceBootStart",
			Type = "Event",
			LiteralName = "INSTANCE_BOOT_START",
		},
		{
			Name = "InstanceBootStop",
			Type = "Event",
			LiteralName = "INSTANCE_BOOT_STOP",
		},
		{
			Name = "InstanceGroupSizeChanged",
			Type = "Event",
			LiteralName = "INSTANCE_GROUP_SIZE_CHANGED",
		},
		{
			Name = "PartyInviteCancel",
			Type = "Event",
			LiteralName = "PARTY_INVITE_CANCEL",
		},
		{
			Name = "PartyInviteRequest",
			Type = "Event",
			LiteralName = "PARTY_INVITE_REQUEST",
			Payload =
			{
				{ Name = "name", Type = "cstring", Nilable = false },
				{ Name = "isTank", Type = "bool", Nilable = false },
				{ Name = "isHealer", Type = "bool", Nilable = false },
				{ Name = "isDamage", Type = "bool", Nilable = false },
				{ Name = "isNativeRealm", Type = "bool", Nilable = false },
				{ Name = "allowMultipleRoles", Type = "bool", Nilable = false },
				{ Name = "inviterGUID", Type = "WOWGUID", Nilable = false },
			},
		},
		{
			Name = "PartyLeaderChanged",
			Type = "Event",
			LiteralName = "PARTY_LEADER_CHANGED",
		},
		{
			Name = "PartyLootMethodChanged",
			Type = "Event",
			LiteralName = "PARTY_LOOT_METHOD_CHANGED",
		},
		{
			Name = "PartyMemberDisable",
			Type = "Event",
			LiteralName = "PARTY_MEMBER_DISABLE",
			Payload =
			{
				{ Name = "unitTarget", Type = "UnitToken", Nilable = false },
			},
		},
		{
			Name = "PartyMemberEnable",
			Type = "Event",
			LiteralName = "PARTY_MEMBER_ENABLE",
			Payload =
			{
				{ Name = "unitTarget", Type = "UnitToken", Nilable = false },
			},
		},
		{
			Name = "PlayerDifficultyChanged",
			Type = "Event",
			LiteralName = "PLAYER_DIFFICULTY_CHANGED",
		},
		{
			Name = "PlayerRolesAssigned",
			Type = "Event",
			LiteralName = "PLAYER_ROLES_ASSIGNED",
		},
		{
			Name = "RaidRosterUpdate",
			Type = "Event",
			LiteralName = "RAID_ROSTER_UPDATE",
		},
		{
			Name = "ReadyCheck",
			Type = "Event",
			LiteralName = "READY_CHECK",
			Payload =
			{
				{ Name = "initiatorName", Type = "cstring", Nilable = false },
				{ Name = "readyCheckTimeLeft", Type = "time_t", Nilable = false },
			},
		},
		{
			Name = "ReadyCheckConfirm",
			Type = "Event",
			LiteralName = "READY_CHECK_CONFIRM",
			Payload =
			{
				{ Name = "unitTarget", Type = "UnitToken", Nilable = false },
				{ Name = "isReady", Type = "bool", Nilable = false },
			},
		},
		{
			Name = "ReadyCheckFinished",
			Type = "Event",
			LiteralName = "READY_CHECK_FINISHED",
			Payload =
			{
				{ Name = "preempted", Type = "bool", Nilable = false },
			},
		},
		{
			Name = "VoteKickReasonNeeded",
			Type = "Event",
			LiteralName = "VOTE_KICK_REASON_NEEDED",
			Payload =
			{
				{ Name = "name", Type = "cstring", Nilable = false },
				{ Name = "resultGUID", Type = "WOWGUID", Nilable = false },
			},
		},
	},

	Tables =
	{
	},
};

APIDocumentation:AddDocumentationTable(PartyInfo);