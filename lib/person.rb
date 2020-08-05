# Code developed by Vincent Collis and Tim Butler
require 'pry'

class Person
    attr_reader :name
    # attr_writer :hygiene_points, :happiness_points
    attr_accessor :bank, :hygiene_points, :happiness_points

    def initialize(name, bank='$25', happiness_points = 8, hygiene_points = 8) 
        @name = name
        @bank = bank
        @happiness_points = happiness_points
        @hygiene_points = hygiene_points
    end

    def hygiene_check(hygiene_points)
        if hygiene_points >= 10
            @hygiene_points = 10
        elsif hygiene_points <= 0
            @hygiene_points = 0
        else
            @hygiene_points = hygiene_points
        end
    end
    
    def happiness_check(happiness_points)
        if happiness_points >= 10
            @happiness_points = 10
        elsif happiness_points <= 0
            @happiness_points = 0
        else
            @happiness_points = happiness_points
        end
    end

    def clean?
        if @hygiene_points > 7
            true
        else
            @hygiene_points <= 7
            false
        end
    end

    def happy?
        if @happiness_points > 7
            true
        else
            @happiness_points <= 7
            false
        end
    end

    def get_paid(salary)
        @bank += salary
        return "all about the benjamins"
    end

    def take_bath
        @hygiene_points += 4
        hygiene_check(@hygiene_points)
        return "♪ Rub-a-dub just relaxing in the tub ♫"
    end

    def work_out
        @happiness_points += 2
        @hygiene_points -= 3

        hygiene_check(hygiene_points)
        happiness_check(happiness_points)
        return "♪ another one bites the dust ♫"
    end

    def call_friend(person = "friend")
        #default person +3
        @happiness_points +=3
        happiness_check(@happiness_points)
        if person != 'friend'
            person.happiness_points += 3
            person.happiness_check(person.happiness_points)
        end
    end

    def start_conversation(person, topic)
        if topic == "politics"
            @happiness_points -= 1
            person.happiness_points -= 1
            return "blah blah partisan blah lobbyist"
        elsif topic == "weather"
            @happiness_points += 1
            person.happiness_points += 1
            return "blah blah sun blah rain"
        elsif topic != "politics" || topic != "weather"
            return "blah blah blah blah blah"
        end
        
    end
end

vincent = Person.new('Vince')
tim = Person.new('Tim')

binding.pry


