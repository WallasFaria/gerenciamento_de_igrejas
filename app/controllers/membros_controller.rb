class MembrosController < InheritedResources::Base
  load_and_authorize_resource
  belongs_to :filial

  def index
    if params[:filial_id]
      @membros = Membro.where('ativo = ? and filial_id = ?', true, params[:filial_id]).paginate :page => params[:page], :per_page => 10
    else
      @membros = Membro.find_all_by_ativo(true).paginate :page => params[:page], :per_page => 10
    end
  end
  
  def show
    @membro = Membro.find(params[:id])
  end

  def historico
    @membro = Membro.find(params[:id])
  end

  def transferencia
    @membro = Membro.find(params[:id])
    @transferencia = @membro.transferencias.new
  end

  def transferir
    @membro = Membro.find(params[:id])
    @transferencia = params[:transferencia]
    if @membro.transferir(@transferencia['data'], (@transferencia['filial_destino_id']).to_i)
      redirect_to(@membro, :notice => 'Transferencia was successfully created.')
    else
      @transferencia = @membro.retorno
      render :action => "transferencia"
    end
  end

  def desligamento
    @membro = Membro.find(params[:id])
    @desligamento = @membro.desligamentos.new
  end
  
  def desligar
    @membro = Membro.find(params[:id])
    @desligamento = params[:desligamento]
    
    if @membro.desligar(@desligamento['data'], @desligamento['motivo'], @desligamento['descricao'])
      redirect_to(membros_path, :notice => 'Membro foi desligado com sucesso.')
    else
      @desligamento = @membro.retorno
      render :action => "desligamento"
    end
  end
  
  def novo_telefone
    @membro = Membro.find(params[:id])
    @telefone = @membro.telefones.new
  end
  
  def add_telefone
    @membro = Membro.find(params[:id])
    @telefone = @membro.telefones.new(params[:telefone])
    if @telefone.save
      redirect_to("/filiais/#{@membro.filial.id}/membros/#{@membro.id}", :notice => 'Telefone adicionado com sucesso.')
    else
      render :action => "novo_telefone"
    end
  end

end

=begin
class Form
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  def persisted?; false; end
  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end
end

class FormDesligamento < Form
  validates_presence_of :data, :motivo, :descricao
  attr_accessor :data, :motivo, :descricao
end

class FormTransferencia < Form
  validates_presence_of :data, :filial_destino
  attr_accessor :data, :filial_destino
end

class FormTelefone < Form
  validates_presence_of :numero
  attr_accessor :numero
end
=end


