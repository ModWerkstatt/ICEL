local soundeffectsutil = require "soundeffectsutil"

function data()
return {
	events = {
		openDoors = { names = { "vehicle/ICEL/dooropen.wav" }, refDist = 10.0 },
		closeDoors = { names = { "vehicle/ICEL/doorclose.wav" }, refDist = 10.0 }
	},

	updateFn = function (input)
		return {
			events = {
				openDoors = { gain = 1.00, pitch = 1.0 },
				closeDoors = { gain = 1.00, pitch = 1.0 }
			}
		}
	end
}
end
