local soundeffectsutil = require "soundeffectsutil"

function data()
return {
	tracks = {
		{ name = "vehicle/ICEL/roll.wav", refDist = 20.5 },
		{ name = "vehicle/train/wheels_ringing2.wav", refDist = 20.0 },
		{ name = "vehicle/ICEL/bremse.wav", refDist = 20.0 }
	},
	events = {

	},

	updateFn = function (input)
		return {
			tracks = {
				{
					gain = soundeffectsutil.sampleCurve({ { 0.0, 0.0 }, { 1.0, 1.2 } }, input.speed01),
					pitch = soundeffectsutil.sampleCurve({ { 0.0, 0.9 }, { 0.57, 1.00 }, { 1.0, 1.035 } }, input.speed01)
				},
				soundeffectsutil.squeal(input.speed, input.sideForce, input.maxSideForce),
				soundeffectsutil.brake(input.speed, input.brakeDecel, 0.4)
			},
			events = {
				openDoors = { gain = 1.00, pitch = 1.0 },
				closeDoors = { gain = 1.00, pitch = 1.0 }
			}
		}
	end
}
end
