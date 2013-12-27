require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe RequestsController do
  login_user

  # This should return the minimal set of attributes required to create a valid
  # Request. As you add validations to Request, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "title" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # RequestsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  let(:valid_request) { {} }

  before do
    @suite = subject.current_user.suites.create!(:name => "MySuite")
    @page = @suite.pages.create!(:name => "MyPage")
    valid_request.merge!({:suite_id => @suite.to_param, :page_id => @page.to_param})
  end

  describe "GET index" do
    it "assigns all requests as @requests" do
      request = @page.requests.create! valid_attributes
      get :index, valid_request, valid_session
      assigns(:requests).should eq([request])
    end
  end

  describe "GET show" do
    it "assigns the requested request as @request" do
      request = @page.requests.create! valid_attributes
      get :show, valid_request.merge({:id => request.to_param}), valid_session
      assigns(:request).should eq(request)
    end
  end

  describe "GET new" do
    it "assigns a new request as @request" do
      get :new, valid_request, valid_session
      assigns(:request).should be_a_new(Request)
    end
  end

  describe "GET edit" do
    it "assigns the requested request as @request" do
      request = @page.requests.create! valid_attributes
      get :edit, valid_request.merge({:id => request.to_param}), valid_session
      assigns(:request).should eq(request)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Request" do
        expect {
          post :create, valid_request.merge({:request => valid_attributes}), valid_session
        }.to change(Request, :count).by(1)
      end

      it "assigns a newly created request as @request" do
        post :create, valid_request.merge({:request => valid_attributes}), valid_session
        assigns(:request).should be_a(Request)
        assigns(:request).should be_persisted
      end

      it "redirects to the created request" do
        post :create, valid_request.merge({:request => valid_attributes}), valid_session
        response.should redirect_to(suite_page_request_url(@suite, @page, Request.last))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved request as @request" do
        # Trigger the behavior that occurs when invalid params are submitted
        Request.any_instance.stub(:save).and_return(false)
        post :create, valid_request.merge({:request => { "title" => "invalid value" }}), valid_session
        assigns(:request).should be_a_new(Request)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Request.any_instance.stub(:save).and_return(false)
        post :create, valid_request.merge({:request => { "title" => "invalid value" }}), valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested request" do
        request = @page.requests.create! valid_attributes
        # Assuming there are no other requests in the database, this
        # specifies that the @page.requests.created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Request.any_instance.should_receive(:update).with({ "title" => "MyString" })
        put :update, valid_request.merge({:id => request.to_param, :request => { "title" => "MyString" }}), valid_session
      end

      it "assigns the requested request as @request" do
        request = @page.requests.create! valid_attributes
        put :update, valid_request.merge({:id => request.to_param, :request => valid_attributes}), valid_session
        assigns(:request).should eq(request)
      end

      it "redirects to the request" do
        request = @page.requests.create! valid_attributes
        put :update, valid_request.merge({:id => request.to_param, :request => valid_attributes}), valid_session
        response.should redirect_to(suite_page_request_url(@suite, @page, request))
      end
    end

    describe "with invalid params" do
      it "assigns the request as @request" do
        request = @page.requests.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Request.any_instance.stub(:save).and_return(false)
        put :update, valid_request.merge({:id => request.to_param, :request => { "title" => "invalid value" }}), valid_session
        assigns(:request).should eq(request)
      end

      it "re-renders the 'edit' template" do
        request = @page.requests.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Request.any_instance.stub(:save).and_return(false)
        put :update, valid_request.merge({:id => request.to_param, :request => { "title" => "invalid value" }}), valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested request" do
      request = @page.requests.create! valid_attributes
      expect {
        delete :destroy, valid_request.merge({:id => request.to_param}), valid_session
      }.to change(Request, :count).by(-1)
    end

    it "redirects to the requests list" do
      request = @page.requests.create! valid_attributes
      delete :destroy, valid_request.merge({:id => request.to_param}), valid_session
      response.should redirect_to(suite_page_requests_url(@suite, @page))
    end
  end

end
