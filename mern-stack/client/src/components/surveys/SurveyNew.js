import React, { Component } from 'react';
import { reduxForm } from 'redux-form';

import SurveyForm from './SurveyForm';
import SurveyFormReview from './SurveyFormReview';

class SurveyNew extends Component {
  state = { isReviewStep: false };

  renderContent() {
    if (this.state.isReviewStep) {
      return <SurveyFormReview onCancel={() => this.setState({ isReviewStep: false })} />;
    }

    return <SurveyForm onSurveySubmit={() => this.setState({ isReviewStep: true })} />;
  }

  render() {
    return <div>{this.renderContent()}</div>;
  }
}

export default reduxForm({
  form: 'surveyForm',
})(SurveyNew);
