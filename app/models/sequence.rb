class Sequence < ApplicationRecord
  include CalcHelper
  include ActiveModel::Serializers::Xml

  attr_accessor :db_v

  before_save :result_into_db
  self.primary_key = :enteredseq

  def result_into_db
    @data = $v

    res = Sequence.processor(@data)
    self.enteredseq = res[0]
    self.subseq = res[1]
    self.maxseq = res[2]
  end

  def check_existing
		check_val = db_v
		if Sequence.find_by(enteredseq: check_val).nil?
			nil
		else
			does_exist(check_val)
		end
	end

  def self.processor(mas)
    arr = []
    boofer = []
    cur = mas[0]
    mas.each do |i|
      if i >= cur
        boofer.push(i)
        cur = i
      else
        arr.push(boofer)
        boofer = []
        boofer.push(i)
        cur = i
      end
    end
    arr.push(boofer)
    s1 = mas.join(' ')
    s2 = composit(arr)
    s3 = maxlenseq(arr)
    [s1,s2,s3]
  end
  def self.composit(a)
    s = ""
    a.each do |i|
      s += i.join(' ')
      s += ', ' if i != a[-1]
    end
    s
  end
  def self.maxlenseq(a)
    n = []
    a.each{|i| n = i if i.length > n.length}
    n.join(' ')
  end
end
