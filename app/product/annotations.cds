using CatalogService as service from '../../srv/catalog-service';

annotate service.Products with @(

    Capabilities : {DeleteRestrictions : {
        $Type : 'Capabilities.DeleteRestrictionsType',
        Deletable : false
    },}

    UI.HeaderInfo                : {
        TypeName      : 'Product',
        TypeNamePlural: 'Products',
        ImageUrl      : ImageUrl,
        Title         : {Value: ProductName},
        Description   : {Value: Description}
    },
    UI.SelectionFields           : [
        ToCategory_ID,
        ToCurrency_ID,
        StockAvailability
    ],
    UI.FieldGroup #GeneratedGroup: {
        $Type: 'UI.FieldGroupType',
        Data : [
            // {
            //     $Type: 'UI.DataField',
            //     Label: 'ProductName',
            //     Value: ProductName,
            // },
            // {
            //     $Type: 'UI.DataField',
            //     Label: 'Description',
            //     Value: Description,
            // },
            // {
            //     $Type: 'UI.DataField',
            //     Label: 'ImageUrl',
            //     Value: ImageUrl,
            // },
            {
                $Type: 'UI.DataField',
                Label: 'ReleaseDate',
                Value: ReleaseDate,
            },
            {
                $Type: 'UI.DataField',
                Label: 'DiscontinuedDate',
                Value: DiscontinuedDate,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Price',
                Value: Price,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Height',
                Value: Height,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Width',
                Value: Width,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Depth',
                Value: Depth,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Quantity',
                Value: Quantity,
            },
            {
                $Type: 'UI.DataField',
                Label: 'ToUnitOfMeasure_ID',
                Value: ToUnitOfMeasure_ID,
            },
            {
                $Type: 'UI.DataField',
                Label: 'ToCurrency_ID',
                Value: ToCurrency_ID,
            },
            {
                $Type: 'UI.DataField',
                Label: 'CurrencyId',
                Value: CurrencyId,
            },
            {
                $Type: 'UI.DataField',
                Label: 'ToCategory_ID',
                Value: ToCategory_ID,
            },
            {
                $Type: 'UI.DataField',
                Label: 'CategoryId',
                Value: CategoryId,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Category',
                Value: Category,
            },
            {
                $Type: 'UI.DataField',
                Label: 'ToDimensionUnit_ID',
                Value: ToDimensionUnit_ID,
            },
            {

                $Type : 'UI.DataFieldForAnnotation',
                Label : 'Rating',
                Target: '@UI.DataPoint#AverageRatings'
            },
            {
                $Type: 'UI.DataField',
                Label: 'StockAvailability',
                Value: StockAvailability,
            },
        ],
    },
    UI.Facets                    : [
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'GeneratedFacet1',
            Label : 'General Information',
            Target: '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'GeneratedFacet2',
            Label : 'General Information Copia',
            Target: '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.HeaderFacets              : [{
        $Type : 'UI.ReferenceFacet',
        Target: '@UI.DataPoint#AverageRatings'

    }, ],
    UI.LineItem                  : [
        {
            $Type: 'UI.DataField',
            Label: 'ImageUrl',
            Value: ImageUrl,
        },
        {
            $Type: 'UI.DataField',
            Label: 'ProductName',
            Value: ProductName,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Description',
            Value: Description,
        },
        {
            $Type : 'UI.DataFieldForAnnotation',
            Label : 'Supplier',
            Target: 'Supplier/@Communication.Contact',
        },
        {
            $Type: 'UI.DataField',
            Label: 'ReleaseDate',
            Value: ReleaseDate,
        },
        {
            $Type: 'UI.DataField',
            Label: 'DiscontinuedDate',
            Value: DiscontinuedDate,
        },
        {
            $Type      : 'UI.DataField',
            Label      : 'Stock Availability',
            Value      : StockAvailability,
            Criticality: StockAvailability,
        },
        {
            // $Type: 'UI.DataField',
            $Type : 'UI.DataFieldForAnnotation',
            Label : 'Rating',
            Target: '@UI.DataPoint#AverageRatings'

        // Value: Rating,
        },
        {
            $Type: 'UI.DataField',
            Label: 'Price',
            Value: Price,
        },
    ],
);

annotate service.Products with {
    Supplier @Common.ValueList: {
        $Type         : 'Common.ValueListType',
        CollectionPath: 'Supplier',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: Supplier_ID,
                ValueListProperty: 'ID',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'Name',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'Email',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'Phone',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'Fax',
            },
        ],
    }
};

annotate service.Products with {
    ImageUrl @(UI.IsImageURL: true)
};


/**
 * Anotations for SH
 */

annotate service.Products with {
    //Category
    ToCategory        @(Common: {
        Text     : {
            $value                : Category,
            ![@UI.TextArrangement]: #TextOnly,
        },
        ValueList: {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'VH_Categories',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: ToCategory_ID,
                    ValueListProperty: 'Code'
                },
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: ToCategory_ID,
                    ValueListProperty: 'Text'
                }
            ]
        },
    });

    //Currency
    ToCurrency        @(Common: {
        ValueListWithFixedValues: true,
        ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'VH_Currencies',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: ToCurrency_ID,
                    ValueListProperty: 'Code'
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'Text'


                }
            ]
        },
    });

    //StockAvailability
    StockAvailability @(Common: {
        ValueListWithFixedValues: true,
        ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'StockAvailability',
            Parameters    : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: StockAvailability,
                ValueListProperty: 'ID'
            },
            // {
            //     $Type            : 'Common.ValueListParameterInOut',
            //     LocalDataProperty: StockAvailability,
            //     ValueListProperty: 'Description'
            // },

            ]
        },
    });


};


/**
 * Anotations for VH_Categories Entity
 */

annotate service.VH_Categories {

    Code @(
        UI    : {Hidden: true},
        Common: {Text: {
            $value                : Text,
            ![@UI.TextArrangement]: #TextOnly,
        }}
    );
    Text @(UI: {HiddenFilter: true});

};

annotate service.VH_Currencies {

    Code @(UI: {HiddenFilter: true});
    Text @(UI: {HiddenFilter: true});

};

annotate service.StockAvailability {

    ID @(
         // UI    : {Hidden: true},
       Common: {Text: {
        $value                : Description,
        ![@UI.TextArrangement]: #TextOnly,
    }});
// Text @(UI: {HiddenFilter: true});

};

annotate service.VH_UnitOfMeasure {

    Code @(UI: {HiddenFilter: true});
    Text @(UI: {HiddenFilter: true});

};

annotate service.VH_DimensionUnits {

    Code @(UI: {HiddenFilter: true});
    Text @(UI: {HiddenFilter: true});

};

/**
 * Anotations for Supplier Entity
 */

annotate service.Supplier with @(Communication: {Contact: {
    $Type: 'Communication.ContactType',
    fn   : Name,
    role : 'Supplier',
    photo: 'sap-icon://supplier',
    email: [{
        type   : #work,
        address: Email
    }],
    tel  : [
        {
            type: #work,
            uri : Email
        },
        {
            type: #fax,
            uri : Fax
        },
    ],

}, });

/**
 *  Data Point for Average Rating
 */

annotate service.Products with @(UI.DataPoint #AverageRatings: {
    Value        : Rating,
    Title        : 'Rating',
    TargetValue  : 5,
    Visualization: #Rating
}, );
