require'pry'

class Instructor

    attr_reader :name

    @@all = [] 

    def initialize(name)
        @name = name
        @@all << self
    end 

    def self.all 
        @@all
    end 

    def all_student
        BoatingTest.all.select{|tests| tests.boat_instructor == self}
    end 

    def passed_students
        BoatingTest.all.select{|tests| tests.boat_instructor == self && tests.test_status == "passed"}
    end 

    def pass_student(student, boating_test) 
        BoatingTest.all.select do |tests| 
            if student == tests.student && boating_test == tests.boating_test
                results = tests.test_status = "passed" 
                return tests
            else 
                BoatingTest.new(student, boating_test, "passed", self)
            end 
        end 
    end 

    def fail_student(student, boating_test)
        BoatingTest.all.select do |tests| 
            if student == tests.student && boating_test == tests.boating_test
                results = tests.test_status = "failed" 
                return tests
            else 
                BoatingTest.new(student, boating_test, "failed", self)
            end 
        end
    end 

end
