# data access object
#DAO é a classe helper para operações no banco de dados MONGO db
require 'mongo'

class DAO
    attr_accessor :client

    Mongo::Logger.logger = Logger.new('log/mongo.log')

    def initialize
        str_conn = 'mongodb://aluno:qaninja@ds225078.mlab.com:25078/heroku_4m3km28x'
        @client = Mongo::Client.new(str_conn)
    end

    
    def remover_usuario(email)
        users = @client[:users]
        users.delete_one('profile.email' => email) #delete_one apaga somente 1 com a condição
    end

    def remover_tarefas(nome)
        tasks = @client[:tasks]
        tasks.delete_many('title' => nome) # delete_many apaga todos os registros com a condição
    end

end