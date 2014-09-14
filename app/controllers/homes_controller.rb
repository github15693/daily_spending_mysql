class HomesController < ApplicationController
  def index
      @rs1 = encrypt 'sao được rồi nè ch'
    # temp = IndividualChat.last.message
    @rs2 = decrypt(@rs1)
  end
end
