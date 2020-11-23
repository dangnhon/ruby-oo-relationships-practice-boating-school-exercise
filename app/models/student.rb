require 'pry'

class Student

    attr_reader :first_name

    @@all = [] 

    def initialize(first_name)
        @first_name = first_name
        @@all << self
    end 

    def self.all 
        @@all
    end 

    def add_boating_test(boating_test, test_status, boat_instructor)
        BoatingTest.new(self, boating_test, test_status, boat_instructor)
    end 

    def all_instructors 
        BoatingTest.all.select{|tests| tests.student == self}.uniq  
    end 

    def self.find_student(first_name) 
        @@all.find_all{|student| student.itself == first_name}
    end 

    def grade_percentage
        passed = 0.00
        failed = 0.00
        BoatingTest.all.select do |tests|
            #binding.pry
            if tests.student == self && tests.test_status == "passed" 
                passed += 1
            elsif
                tests.student == self && tests.test_status == "failed" 
                failed += 1
            end 
        end 
        total_tests = passed + failed 
        passed/total_tests * 100
    end 

end
