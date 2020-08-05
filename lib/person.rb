# Code developed by Vincent Collis and Tim Butler
# require 'pry'

class Person
    attr_reader :name
    attr_accessor :bank_account, :hygiene, :happiness

    def initialize(name, bank_account=25, happiness = 8, hygiene = 8) 
        @name = name
        @bank_account = bank_account
        @happiness = happiness
        @hygiene = hygiene
    end

    def hygiene_check(hygiene)
        if hygiene >= 10
            @hygiene = 10
        elsif hygiene <= 0
            @hygiene = 0
        else
            @hygiene = hygiene
        end
    end
    
    def happiness_check(happiness)
        if happiness >= 10
            @happiness = 10
        elsif happiness <= 0
            @happiness = 0
        else
            @happiness = happiness
        end
    end

    def clean?
        if @hygiene > 7
            true
        else
            @hygiene <= 7
            false
        end
    end

    def happy?
        if @happiness > 7
            true
        else
            @happiness <= 7
            false
        end
    end

    def get_paid(salary)
        @bank_account += salary
        return "all about the benjamins"
    end

    def take_bath
        @hygiene += 4
        hygiene_check(@hygiene)
        return "♪ Rub-a-dub just relaxing in the tub ♫"
    end

    def work_out
        @happiness += 2
        @hygiene -= 3

        hygiene_check(hygiene)
        happiness_check(happiness)
        return "♪ another one bites the dust ♫"
    end

    def call_friend(person = "friend")
        #default person +3
        @happiness +=3
        happiness_check(@happiness)
        if person != 'friend'
            person.happiness += 3
            person.happiness_check(person.happiness)
        end
    end

    def start_conversation(person, topic)
        if topic == "politics"
            @happiness -= 2
            person.happiness -= 2
            return "blah blah partisan blah lobbyist"
        elsif topic == "weather"
            @happiness += 1
            person.happiness += 1
            return "blah blah sun blah rain"
        elsif topic != "politics" || topic != "weather"
            return "blah blah blah blah blah"
        end
        
    end
end


