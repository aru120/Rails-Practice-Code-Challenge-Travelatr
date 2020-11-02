class DestinationsController < ApplicationController

    def index
        @destinations = Destination.all
    end

    def show
        @destination = Destination.find(params[:id])
    
    end

#     def new
#         @blogger = Blogger.new
#     end

#     def create
#         @blogger = Blogger.create(blogger_params)

#         if @blogger.valid?
#         redirect_to blogger_path(@blogger)
#         else
#             flash[:blogger_errors] = @blogger.errors.full_messages
#             redirect_to new_blogger_path
#         end
#     end


# private
#     def blogger_params
#         params.require(:blogger).permit(:name,:bio,:age)
#     end

end
