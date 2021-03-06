require 'DockingStation'

feature "public accesses bike from docking station" do
	let(:docking_station) {DockingStation.new}

	scenario "releases a working bike from the docking station" do
		docking_station.dock double :bike, broken?: false, working?: true
		bike = docking_station.release_bike
		expect(bike).to be_working
	end

	scenario "raises an error if there are no bikes in the docking station" do
		expect{docking_station.release_bike}.to raise_error "No Bikes Available"
	end

	scenario 'docking station does not release a broken bike' do
		bike = Bike.new
		bike.report_broken
		docking_station.dock bike 
		expect{docking_station.release_bike}.to raise_error 'Bike not working'
	end
end 
