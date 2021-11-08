class DiariesController < ApplicationController
    def index
        @diaries = Diary.all
      
    end
    
    def new
        @diary = Diary.new
    end
    
    def create
        diary = Diary.new(title: params[:diary][:title], message: params[:diary][:message])
        diary.save
        redirect_to root_path
    end
end
