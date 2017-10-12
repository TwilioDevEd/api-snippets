rout, wout = IO.pipe
rerr, werr = IO.pipe

Process.spawn('bash -c "python test.py"', out: wout, err: werr)

wout.close
werr.close

puts rout.read
