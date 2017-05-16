class Ability
	include CanCan::Ability

	def initialize(user)
		# Define abilities for the passed in user here. For example:
		#
		user ||= User.new(guest: true) # guest user (not logged in)
		if user.admin or user.id == 1
			can :manage, :all
		end
		unless user.guest
			can :create, Transaction
			can :check_in, Transaction
			can :check_out, Transaction
			can :check_in, :item
			can :check_out, :item
		end
		can :view, User
		can :index, :all
		can :show, :all
		can :read, :all
		#
		# The first argument to `can` is the action you are giving the user
		# permission to do.
		# If you pass :manage it will apply to every action. Other common actions
		# here are :read, :create, :update and :destroy.
		#
		# The second argument is the resource the user can perform the action on.
		# If you pass :all it will apply to every resource. Otherwise pass a Ruby
		# class of the resource.
		#
		# The third argument is an optional hash of conditions to further filter the
		# objects.
		# For example, here the user can only update published articles.
		#
		#   can :update, Article, :published => true
		#
		# See the wiki for details:
		# https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
	end
end
