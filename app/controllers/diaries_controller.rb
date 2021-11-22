class DiariesController < ApplicationController
    def index
        @diaries = Diary.all
      
    end
    
    def new
        @diary = Diary.new
        @question = Question.offset(rand(Question.count)).first.id
    end
    
    def create
<<<<<<< HEAD
        file = params[:diary][:file].read
        diary = Diary.new(title: params[:diary][:title], message: params[:diary][:message],
        file: file, date: Time.current,qid: params[:diary][:qid])
        diary.save
        redirect_to diaries_path
=======
        if  params[:diary][:file].present?
            file = params[:diary][:file].read
            diary = Diary.new(title: params[:diary][:title], message: params[:diary][:message],
            file: file, date: Time.current)
            diary.save
            redirect_to diaries_path
        else
            diary = Diary.new(title: params[:diary][:title], message: params[:diary][:message],
            date: Time.current)
            
            if diary.save
                redirect_to diaries_path
            else
                render 'new'
            end
        end
     
>>>>>>> validation
    end
    
    def get_image
        diary = Diary.find(params[:id]) #↓詳細は説明を後述する
        send_data diary.file, disposition: :inline, type: 'image/jpg'
    end
    
    def destroy
        diary = Diary.find(params[:id])
        diary.destroy
        redirect_to diaries_path
    end
    
    def edit
        @diary = Diary.find(params[:id])
    end
    
    def update
        diary = Diary.find(params[:id])
        file = params[:diary][:file].read
        diary.update(title: params[:diary][:title], message: params[:diary][:message], file: file)
        redirect_to root_path
    
    end
end
