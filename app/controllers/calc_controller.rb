class CalcController < ApplicationController
  include CalcHelper
  def input
  end

  def output
    @flag = false
    $v = params[:v].scan(/\d+/).map(&:to_i)
    if $v.length < 10
       @result = "Количество целых чисел в последовательности должно быть больше 9!"
    else
      @sequences = Sequence.find_by(enteredseq: params[:v])
      return @arr = [@sequences.enteredseq, @sequences.subseq, @sequences.maxseq] unless @sequences.nil?

      @sequences = Sequence.new(enteredseq: params[:v])
      return unless @sequences.valid?

      @sequences.save
      @flag = true
      @arr = [@sequences.enteredseq, @sequences.subseq, @sequences.maxseq]
    end
  end

  def db_input
  end

  def db_output
    @check_par = params.permit(:db_v)
    @check_seq = Sequence.new(@check_par)
    @check_res = @check_seq.check_existing
  end

  def check_data_xml
    render xml: Sequence.all
  end

end
