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
				key = "icel_fake",
				name = _("fake_activation"),
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

	    local fakeFilter = function(fileName, data)
			if data.metadata.transportVehicle and data.metadata.icel and data.metadata.icel.fake == true then
				data.metadata.availability.yearFrom = 1
				data.metadata.availability.yearTo = 1
			end
			return data
		end

        if modParams[getCurrentModId()] ~= nil then
			local params = modParams[getCurrentModId()]
			if params["icel_fake"] == 0 then
				addModifier("loadModel", fakeFilter)
			end
        else
            addModifier("loadModel", fakeFilter)
        end
    end
	}
end
