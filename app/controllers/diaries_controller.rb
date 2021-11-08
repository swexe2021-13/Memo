class DiariesController < ApplicationController
    def index
        @diaries = Diary.all
      
    end
    
    def new
        @diary = Diary.new
    end
    
    def create
        diary = Diary.new(title: params[:diary][:title],message: params[:diary][:message])
        diary.save
        redirect_to root_path
    end
    
    def get_image
        diary = Diary.find(params[:id]) #↓詳細は説明を後述する
        send_data image.file, disposition: :inline, type: 'image/jpg'
    end
    
    def destroy
        diary = Diary.find(params[:id])
        diary.destroy
        redirect_to root_path
    end
    
    def edit
        @diary = Diary.find(params[:id])
    end
    
    def update
        diary = Diary.find(params[:id])
        diary.update(title: params[:diary][:title], message: params[:diary][:message])
        redirect_to root_path
    
    end
end
