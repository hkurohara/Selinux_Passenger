all: passenger.pp
	semodule -i passenger.pp

passenger.pp: passenger.mod
	semodule_package -o passenger.pp -m passenger.mod

passenger.mod: passenger.te
	checkmodule -M -m -o passenger.mod passenger.te


