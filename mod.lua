function data()
return {
	info = {
		minorVersion = 0,
		severityAdd = "NONE",
		severityRemove = "WARNING",
		name = _("mod_name"),
		description = _("mod_desc"),
		tags = { "europe", "train", "deutsche bahn", "ice", "high speed" },

        params = {
			{
				key = "icelfake",
				name = _("Fake"),
				values = { "No", "Yes", },
				tooltip = _("option_fake_icel_desc"),
				defaultIndex = 0,
			},
		},

		dependencies = { },

        requiredMods = { },

		authors = {
		    {
		        name = "ModWerkstatt",
		        role = "CREATOR",
		    },
		},
        url = { "" },
        visible = true,
	},

	runFn = function (settings, modParams)

	    local hidden = {

		}

		local modelFilter = function(fileName, data)
			local modelName = fileName:match('/icel_([^/]*.lua)')
			return (modelName==nil or hidden[modelName]~=true)
		end

		if modParams[getCurrentModId()] ~= nil then
			local params = modParams[getCurrentModId()]
			if params["icelfake"] == 0 then
				addFileFilter("multipleUnit", modelFilter)
			end
		else
			addFileFilter("multipleUnit", modelFilter)
		end
	end
	}
end
