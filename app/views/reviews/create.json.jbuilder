if @review.persisted?
  json.form json.partial!("reviews/form.html.erb", lawfirm: @lawfirm, review: Review.new)
  json.inserted_item json.partial!("lawfirms/review.html.erb", review: @review)
else
  json.form json.partial!("reviews/form.html.erb", lawfirm: @lawfirm, review: @review)
end
