require 'pry'

class BoatingTest

    attr_reader :student, :boat_instructor
    attr_accessor :test_status, :boating_test

    @@all = [] 

    def initialize(student, boating_test, test_status, boat_instructor)
        @student = student 
        @boating_test = boating_test
        @test_status = test_status
        @boat_instructor = boat_instructor
        @@all << self
    end 

    def self.all 
        @@all
    end 

end
