defmodule Api.Hashpassword do

  def generate_hashed_password(password) do
    Base.encode64(:crypto.hash(:sha256, "r5u8x/A?D(G-KaPd#{password}SgVkYp3s6v9y$B&E") )
  end

end
