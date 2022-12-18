module CalcHelper
	def does_exist(value)
		obj = Sequence.find_by(enteredseq: value)
    seq = obj[:enteredseq]
    sseq = obj[:subseq]
    mseq = obj[:maxseq]
		[seq, sseq, mseq]
	end
end
