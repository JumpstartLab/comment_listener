require 'spec_helper'

describe CommentRecorder do
  describe '.record' do
    it "create a comment" do
      data = {"author_name"=>"Moar Samples", "body"=>"Sample2", "article_id"=>"9"}
      CommentRecorder.record(data)
      expect{ CommentRecorder.record(data) }.to change{Comment.count}.by(1)
    end
  end
end