module WalksHelper
    
    def new_dog_option(f)
        if @dog
            tag.p("Dog: #{@dog.name}")
        else
            render partial: "dogform", locals:{f: f} 
        end
    end

    def walks_heading
        if @dog
            tag.h1("#{@dog.name}'s Scheduled Walks ")
        else 
            tag.h1("Scheduled Walks")
        end
    end
end
