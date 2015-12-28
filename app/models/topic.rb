class Topic < ActiveRecord::Base
  belongs_to :user
  belongs_to :forum
  
  validates :title, presence: true
  validates :body, presence: true, length: {minimum: 20}
  
  #bu şekilde tanımlandığında user_id ve forum_id alanlarına,
  #böyle bir kullanıcı ve konu olmadığı halde atama yapılabiir.
  #-------------------------------------------------------------
  #validates :user_id, presence: true
  #validates :forum_id, presence: true
  
  #yukardaki durumu düzeltmek için, yani varolan bir kullanıcı,
  #ve konuya sadece atama yapmak için ilişkilerin ismi kullanılır;
  validates :user, presence: true
  validates :forum, presence: true
end
