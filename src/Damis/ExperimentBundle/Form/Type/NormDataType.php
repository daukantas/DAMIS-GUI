<?php

namespace Damis\ExperimentBundle\Form\Type;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolverInterface;
use Symfony\Component\Validator\Constraints\Callback;
use Symfony\Component\Validator\Constraints\NotBlank;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Component\Validator\ExecutionContextInterface;

class NormDataType extends AbstractType
{

    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $dataValidator = function ($object, ExecutionContextInterface $context) use ($builder) {
            $data = $_POST['normdata_type'];
            if ($object >= $data['b'] && $data['normMeanStd'] == 1) {
                $context->addViolation('Interval upper bound must be greater than lower', [], null);
            }
        };
        $builder
        ->add('normMeanStd', 'choice', [
                'empty_value' => false,
                'required' => false,
                'data' => 1,
                'expanded' => true,
                'choices' => array(
                    1 => 'Mean a, Standard deviation b',
                    0 => 'Interval [a;b]'
                ),
                'constraints' => [
                    new NotBlank()
                ],
                'label' => 'Choose norm method',
                'label_attr' => ['class' => 'col-md-9']
            ])
        ->add('a', 'number', [
                'required' => true,
                'data' => 0,
                'attr' => array('class' => 'form-control'),
                'constraints' => [
                    new NotBlank(),
                    new Callback([$dataValidator])
                ],
                'label' => 'a',
                'label_attr' => ['class' => 'col-md-1']
            ])
        ->add('b', 'number', [
                'required' => true,
                'data' => 1,
                'attr' => array('class' => 'form-control'),
                'constraints' => [
                    new NotBlank(),
                    new Assert\GreaterThanOrEqual([
                        'value' => 0,
                        'message' => 'Value must be greater than 0'
                    ]),
                ],
                'label' => 'b',
                'label_attr' => ['class' => 'col-md-1']
            ]);
    }

    public function setDefaultOptions(OptionsResolverInterface $resolver)
    {
        $resolver->setDefaults(array(
            'translation_domain' => 'ExperimentBundle'
        ));
    }

    public function getName()
    {
        return 'normdata_type';
    }
}
