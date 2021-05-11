class Article < ApplicationRecord
    # connect the comment model to every article, Active record usage
    has_many :comments
    # value must be present, atleast one none-whitespace
    validates :title, presence: true
    # value must be present. body must be a least 10 char long
    validates :body, presence: true, length: {minimum: 10}
end
