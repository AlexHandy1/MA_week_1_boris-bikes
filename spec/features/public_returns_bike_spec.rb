# As a maintainer of the system,
# So that I can control the distribution of bikes,
# I'd like docking stations not to accept more bikes than their capacity.
require 'DockingStation'


feature 'Member of public returns bike' do
	let(:docking_station) {DockingStation.new 20}

	scenario 'NO I\'M FULL OF BIKES' do
		#this needs to change to something for @capacity
		docking_station.capacity.times {docking_station.dock double :bike}
		expect { docking_station.dock double :bike }.to raise_error 'NO MORE BIKES PLEASE'
	end

	scenario 'bike can be reported broken when returned' do
		bike = Bike.new
		bike.report_broken
		expect { docking_station.dock bike }.not_to raise_error
	end
end