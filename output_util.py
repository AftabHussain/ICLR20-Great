def get_str_data(data):
  data_list = data.numpy().tolist()
  data_str = ' '.join([str(elem) for elem in data_list])
  return data_str

def write_data(name, data, step_count):
  file = open("step_" + str(step_count) + "_output.txt","a")
  file.write(name + "_START |Step:" + str(step_count) + "|Size: " + str(len(data)) + "\n" + get_str_data(data) + "\n" )
  file.write(name + "_END\n")
  file.close()

def write_batch(batch, step_count):
  file = open("step_" + str(step_count) + "_output.txt","a")
  file.write("BATCH_START |Step:" + str(step_count) + "|Size: " + str(len(batch)) + "\n")
  for json_sample in batch:
    file.write(json_sample + "\n")
  file.write("BATCH_END\n")
  file.close()
