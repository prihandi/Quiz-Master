class Question < ApplicationRecord
  validates :question, presence: true, length: { minimum: 3 }
  validates :answer, presence: true

    def is_correct?
      h = {"millions" => "millions","hundreds" => "hundred" }
      # convert all number both integer and float in answer to string
      a = answer.gsub(/\d+(\.[\d]+){0,1}/) { |num| (num.to_i == num.to_f)? num.to_i.humanize : num.to_f.humanize }
      s = submitted_answer.gsub(/\d+(\.[\d]+){0,1}/) { |num| (num.to_i == num.to_f)? num.to_i.humanize : num.to_f.humanize }
      # remove unnecesary character and whitespaces including - 
      a.gsub(/[(),.-]/, ' ').downcase.strip.squeeze(' ').gsub(/\w+/) { |m| h.fetch(m,m)} == s.gsub(/[(),.-]/, ' ').downcase.strip.squeeze(' ').gsub(/\w+/) { |m| h.fetch(m,m)} 
    end
end
