require 'spec_helper'

describe EmployeesController do
 # This should return the minimal set of attributes required to create a valid
  # Company. As you add validations to Company, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CompaniesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all employees as @employees" do
      employee = Employee.create! valid_attributes
      get :index, {}, valid_session
      assigns(:employees).should eq([employee])
    end
  end

  describe "GET show" do
    it "assigns the requested company as @company" do
      employee = Employee.create! valid_attributes
      get :show, {:id => employee.to_param}, valid_session
      assigns(:employee).should eq(employee)
    end
  end

  describe "GET new" do
    it "assigns a new employee as @employee" do
      get :new, {}, valid_session
      assigns(:employee).should be_a_new(Employee)
    end
  end

  describe "GET edit" do
    it "assigns the requested company as @company" do
      employee = Employee.create! valid_attributes
      get :edit, {:id => employee.to_param}, valid_session
      assigns(:employee).should eq(employee)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Employee" do
        expect {
          post :create, {:employee => valid_attributes}, valid_session
        }.to change(Employee, :count).by(1)
      end

      it "assigns a newly created employee as @employee" do
        post :create, {:employee => valid_attributes}, valid_session
        assigns(:employee).should be_a(Employee)
        assigns(:employee).should be_persisted
      end

      it "redirects to the created employee" do
        post :create, {:employee => valid_attributes}, valid_session
        response.should redirect_to(Employee.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved employee as @employee" do
        # Trigger the behavior that occurs when invalid params are submitted
        Employee.any_instance.stub(:save).and_return(false)
        post :create, {:employee => {}}, valid_session
        assigns(:employee).should be_a_new(Employee)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Employee.any_instance.stub(:save).and_return(false)
        post :create, {:employee => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested employee" do
        employee = Employee.create! valid_attributes
        # Assuming there are no other companies in the database, this
        # specifies that the Company created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Employee.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => employee.to_param, :employee => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested employee as @employee" do
        employee = Employee.create! valid_attributes
        put :update, {:id => employee.to_param, :employee => valid_attributes}, valid_session
        assigns(:employee).should eq(employee)
      end

      it "redirects to the employee" do
        employee = Employee.create! valid_attributes
        put :update, {:id => employee.to_param, :employee => valid_attributes}, valid_session
        response.should redirect_to(employee)
      end
    end

    describe "with invalid params" do
      it "assigns the employee as @employee" do
        employee = Employee.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Employee.any_instance.stub(:save).and_return(false)
        put :update, {:id => employee.to_param, :employee => {}}, valid_session
        assigns(:employee).should eq(employee)
      end

      it "re-renders the 'edit' template" do
        employee = Employee.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Employee.any_instance.stub(:save).and_return(false)
        put :update, {:id => employee.to_param, :employee => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested employee" do
      employee = Employee.create! valid_attributes
      expect {
        delete :destroy, {:id => employee.to_param}, valid_session
      }.to change(Employee, :count).by(-1)
    end

    it "redirects to the employees list" do
      employee = Employee.create! valid_attributes
      delete :destroy, {:id => employee.to_param}, valid_session
      response.should redirect_to(employees_url)
    end
  end

end
