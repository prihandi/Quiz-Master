class Question < ApplicationRecord
  validates :question, presence: true, length: { minimum: 3 }
  validates :answer, presence: true
  validate :correct_answer, if: :submitted_answer_present? 

    def correct_answer
      errors.add(:answer, "is not correct yet, Try again!") unless is_correct?
    end

    def submitted_answer_present? 
      submitted_answer.present? 
    end

    def is_correct?
      # convert all number both integer and float in answer to string
      a = answer.gsub(/\d+(\.[\d]+){0,1}/) { |num| (num.to_i == num.to_f)? num.to_i.humanize : num.to_f.humanize }
      s = submitted_answer.gsub(/\d+(\.[\d]+){0,1}/) { |num| (num.to_i == num.to_f)? num.to_i.humanize : num.to_f.humanize }
      # remove unnecesary character and whitespaces including - 
      a.gsub(/[(),.-]/, ' ').downcase.strip.squeeze(' ') == s.gsub(/[(),.-]/, ' ').downcase.strip.squeeze(' ')
    end
end
