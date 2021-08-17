def get_str_data(data):
  data_list = data.numpy().tolist()
  data_str = ' '.join([str(elem) for elem in data_list])
  return data_str
