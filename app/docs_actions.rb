
get '/docs/create' do #document creation page.
  if login?
    erb :'docs/create'
  else
    @message = "Please login or sign up to post a new document"
    @login_error = false
    @user = User.new
    erb :'/users/login'
  end
end

get '/docs' do
    @sorted = Document.order(:created_at)
    erb :'docs/index'
end

get '/docs/sort/:sort_method' do #show list of documents. 
  case params[:sort_method]
    when "documents"
      @sorted = Document.find(:all, :conditions => { :user_id => session[:id] })
    when "commented"
      @sorted = []
      Document.all.each do |document|
        @sorted << document if document.comments.detect {|comment| comment.user_id == session[:id]}
      end  
    when "mostcommented"
      @sorted = Document.all.sort{|x,y| y.comments.count <=> x.comments.count}
    when "newest"
      @sorted = Document.order(:created_at)
    end
  erb :'docs/index'
end


get '/docs/:id' do #show specific document. DO NOT MOVE THIS.
  @document = Document.find(params[:id]) 
  erb :'docs/show'
end

post '/docs' do
  paragraphs = params[:p]
  puts paragraphs
  # The request here is coming from ajax in application.js
  new_doc = Document.new(
    title: params[:t],
    description: params[:d],
    user_id: session[:id]
  )
  
  new_doc.save
  pnum = 0

  paragraphs.each do |p|
    Paragraph.create(
      body: p,
      document_id: new_doc.id,
      position: pnum
    )
    pnum += 1
  end
  new_doc.id.to_s
end

post '/comment' do
  if login?
    @comment = Comment.new(
      content: params[:comment],
      user_id: session[:id],
      paragraph_id: params[:paragraph_id]
    )
    @comment.save
    redirect "docs/#{Paragraph.find(params[:paragraph_id]).document_id}"
  else
    redirect "/users/login"
  end
end

get '/scomment' do
  if Selectioncomment.count > 0
    number_of_scomments = Selectioncomment.last.id + 1
    number_of_scomments.to_s
  else
    "0"
  end
end

post '/scomment' do
  if session[:id]
    paragraph = Paragraph.find(params[:pid])
    paragraph.update(body: params[:pt])
    doc_id = paragraph.document_id
    newComment = Selectioncomment.create(
      content: params[:ct],
      user_id: session[:id],
      document_id: doc_id
    )
    if paragraph.save
      return paragraph.document_id.to_s
    else
      500
    end
  else
    return "userloginpls"
  end
end