class DiariesController < ApplicationController
    def index
        @diaries = Diary.all
      
    end
    
    def new
        @diary = Diary.new
        @question = Question.offset(rand(Question.count)).first.id
    end
    
    def create
        
        if  params[:diary][:file].present?
            file = params[:diary][:file].read
            @diary = Diary.new(title: params[:diary][:title], message: params[:diary][:message],
            file: file, date: Time.current)
            if @diary.save
                flash[:notice] = '1レコード追加しました'
                redirect_to diaries_path
            else
                render 'new'
            end
            
        else
            @diary = Diary.new(title: params[:diary][:title], message: params[:diary][:message],
            date: Time.current)
            
            if @diary.save
                flash[:notice] = '1レコード追加しました'
                redirect_to diaries_path
            else
                render 'new'
            end
        end
     
    end
    
    def get_image
        diary = Diary.find(params[:id]) #↓詳細は説明を後述する
        send_data diary.file, disposition: :inline, type: 'image/jpg'
    end
    
    def destroy
        diary = Diary.find(params[:id])
        diary.destroy
        flash[:notice] = '1レコード削除しました'
        redirect_to diaries_path
    end
    
    def edit
        @diary = Diary.find(params[:id])
    end
    
    def update
        diary = Diary.find(params[:id])
        file = params[:diary][:file].read
        diary.update(title: params[:diary][:title], message: params[:diary][:message], file: file)
        flash[:notice] = '1レコード編集しました'
        redirect_to root_path
    
    end
end
