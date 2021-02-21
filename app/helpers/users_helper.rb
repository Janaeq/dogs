module UsersHelper

    def upcoming_walks
        @user.scheduled_walks.next_walk
    end
end
